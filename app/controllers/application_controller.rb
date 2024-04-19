class ApplicationController < ActionController::API
    def encode_token(payload)
        JWT.encode(payload, 'secret')
    end
    def decode_token
        # Authorization = Bearer token
        auth_header = request.headers['Authorization']
        puts auth_header
        if auth_header
            token = auth_header.split(" ")[1]
            begin
                JWT.decode(token, 'secret', true, algorithm: 'HS256')
                # [{"user_id": "_id"}, {"alg": "HS256"}]
            rescue JWT::DecodeError
                nil
            end
        end
    end
    def authorized_user
        decoded_token = decode_token()
        if decoded_token 
            user_id = decoded_token[0]['user_id']
           @user = User.where(_id: user_id).first
        end
    end
    def authorize
        render json: { message: 'You have to log in.' }, status: :unauthorized unless authorized_user
    end
end
