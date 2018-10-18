require 'google/apis/gmail_v1'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'base64'
require 'mime'
include MIME

class TownhallsMailer
  attr_accessor :emails
  def initialize
    # Valeurs de configuration de l'API
    @oob_uri = 'urn:ietf:wg:oauth:2.0:oob'.freeze
    @application_name = 'Townhalls mailer'.freeze
    @credentials_path = 'credentials.json'.freeze
    @token_path = 'token.yaml'.freeze
    @scope = Google::Apis::GmailV1::AUTH_GMAIL_SEND

    @emails = JSON.parse(File.read("./db/townhalls.json"))

    ##
    # Ensure valid credentials, either by restoring from the saved credentials
    # files or intitiating an OAuth2 authorization. If authorization is required,
    # the user's default browser will be launched to approve the request.
    #
    # @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
    def authorize
      client_id = Google::Auth::ClientId.from_file(@credentials_path)
      token_store = Google::Auth::Stores::FileTokenStore.new(file: @token_path)
      authorizer = Google::Auth::UserAuthorizer.new(client_id, @scope, token_store)
      user_id = 'default'
      credentials = authorizer.get_credentials(user_id)
      if credentials.nil?
        url = authorizer.get_authorization_url(base_url: @oob_uri)
        puts 'Open the following URL in the browser and enter the ' \
            "resulting code after authorization:\n" + url
        code = gets
        credentials = authorizer.get_and_store_credentials_from_code(
          user_id: user_id, code: code, base_url: @oob_uri
        )
      end
      credentials
    end

    # Initialize the API
    @service = Google::Apis::GmailV1::GmailService.new
    @service.client_options.application_name = @application_name
    @service.authorization = authorize

    # Création du contenu générique du message
    @msg = Mail.new
    @msg.date = Time.now
    @msg.subject = "Nouveau format d'éducation"
    @msg.from = {'hi@gmail.com' => 'Boss Man'}

    # Création de la requête, insertion du contenu dans la propriété `raw`
    #(https://developers.google.com/gmail/api/v1/reference/users/messages/send)
    # @message = Google::Apis::GmailV1::Message.new(raw: @msg.to_s)
  end
  @emails = 'test'

  def send_mail
    @emails.each{ |key, value|
      @msg.body = Text.new("Bonjour,
    Je m'appelle Tim, je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. La pédagogie de ntore école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.

    Déjà 500 personnes sont passées par The Hacking Project. Est-ce que la mairie de #{key} veut changer le monde avec nous ?

    Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80
    ", 'plain', 'charset' => 'us-ascii')
      @msg.to   = {
          'thp-student@mailinator.com ' => nil,
      }

      message = Google::Apis::GmailV1::Message.new(raw: @msg.to_s)
      @service.send_user_message('me', message)
    }
  end

  # @service.send_user_message('me', @message)

end


