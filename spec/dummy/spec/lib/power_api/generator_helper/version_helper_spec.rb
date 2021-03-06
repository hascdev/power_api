RSpec.describe PowerApi::GeneratorHelper::VersionHelper, type: :generator do
  describe "#version_number" do
    def perform
      generators_helper.version_number
    end

    it { expect(perform).to eq(1) }
  end

  describe "version_number=" do
    context "with invalid version number" do
      let(:version_number) { "A" }

      it { expect { generators_helper }.to raise_error("invalid version number") }
    end

    context "with zero version number" do
      let(:version_number) { 0 }

      it { expect { generators_helper }.to raise_error("invalid version number") }
    end

    context "with nil version number" do
      let(:version_number) { nil }

      it { expect { generators_helper }.to raise_error("invalid version number") }
    end

    context "with nil blank number" do
      let(:version_number) { "" }

      it { expect { generators_helper }.to raise_error("invalid version number") }
    end

    context "with negative version number" do
      let(:version_number) { -1 }

      it { expect { generators_helper }.to raise_error("invalid version number") }
    end
  end

  describe "#first_version?" do
    def perform
      generators_helper.first_version?
    end

    it { expect(perform).to eq(true) }

    context "when version in not first version" do
      let(:version_number) { "2" }

      it { expect(perform).to eq(false) }
    end
  end
end
