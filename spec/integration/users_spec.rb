# spec/integration/blogs_spec.rb
require "swagger_helper"

describe "Users API" do

  path "/api/v1/users" do

    post "Get all users" do
      tags "Users"
      consumes "application/json", "application/xml"
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :string },
          name: { type: :string },
          email: { type: :string }
        },
        required: [ "id", "name", "email" ]
      }

      response "200", "get users successfully" do
        let(:user) { { name: "Tram", email: "tram@gmail.com" } }
        run_test!
      end

      response "422", "invalid request" do
        let(:blog) { { age: 83 } }
        run_test!
      end
    end
  end

  path "/api/v1/users/{id}" do

    get "Retrieves a user" do
      tags "Users"
      produces "application/json", "application/xml"
      parameter name: :id, in: :body, schema: {
        type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            email: { type: :string }
          },
          required: [ "id", "name", "email" ]
      }

      response "200", "user found" do
        let(:id) { User.create(name: "Tram Le", email: "tramle@gmail.com").id }
        run_test!
      end

      response "404", "user not found" do
        let(:id) { "invalid" }
        run_test!
      end

      response "406", "unsupported accept header" do
        let(:"Accept") { "application/foo" }
        run_test!
      end
    end
  end
end
