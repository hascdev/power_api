RSpec.describe PowerApi::GeneratorHelper::PaginationHelper, type: :generator do
  describe "#api_pagination_initializer_path" do
    let(:expected_path) { "config/initializers/api_pagination.rb" }

    def perform
      generators_helper.api_pagination_initializer_path
    end

    it { expect(perform).to eq(expected_path) }
  end

  describe "api_pagination_initializer_tpl" do
    let(:template) do
      <<~API_PAGINATION
        ApiPagination.configure do |config|
          # If you have more than one gem included, you can choose a paginator.
          config.paginator = :kaminari

          # By default, this is set to 'Total'
          config.total_header = 'X-Total'

          # By default, this is set to 'Per-Page'
          config.per_page_header = 'X-Per-Page'

          # Optional: set this to add a header with the current page number.
          config.page_header = 'X-Page'

          # Optional: set this to add other response format. Useful with tools that define :jsonapi format
          # config.response_formats = [:json, :xml, :jsonapi]
          config.response_formats = [:jsonapi]

          # Optional: what parameter should be used to set the page option
          config.page_param do |params|
            params[:page][:number] if params[:page].is_a?(ActionController::Parameters)
          end

          # Optional: what parameter should be used to set the per page option
          config.per_page_param do |params|
            params[:page][:size] if params[:page].is_a?(ActionController::Parameters)
          end

          # Optional: Include the total and last_page link header
          # By default, this is set to true
          # Note: When using kaminari, this prevents the count call to the database
          config.include_total = true
        end
      API_PAGINATION
    end

    def perform
      generators_helper.api_pagination_initializer_tpl
    end

    it { expect(perform).to eq(template) }
  end
end
