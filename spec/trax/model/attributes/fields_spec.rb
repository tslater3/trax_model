require 'spec_helper'

describe ::Trax::Model::Attributes::Fields do
  subject{ ::Products::MensShoes.fields }

  describe "#all" do
    it { expect(subject.all).to have_key(:size) }

    context "inherited properties" do
      it {
        expect(subject.all).to have_key(:active)
      }
    end
  end

  describe "#by_type" do
    it { expect(subject.by_type(:boolean)).to have_key(:active) }

    context "enums" do
      [:size, :status].each do |k|
        it "has #{k}" do
          expect(subject.by_type(:enum)).to have_key(k)
        end
      end
    end
  end

  describe "#to_schema" do
    it { expect(subject.to_schema).to be_a(Hash) }

    context "enums" do
      it {
        pp subject.to_schema
        expect(subject.to_schema["status"]["source"]).to eq "Products::MensShoes::Fields::Status"
      }

      context "includes full choice definitions" do
        let(:expectation) do
          {
            "source"=>"Products::MensShoes::Fields::Status::InStock",
             "name"=>"in_stock",
             "type"=>:enum_value,
             "integer_value"=>1
          }
        end

        it { expect(subject.to_schema["status"]["choices"][0]).to eq expectation }
      end

      context "values" do
        let(:expectation) do
          ::Products::MensShoes::Fields::Size.names.map(&:to_sym)
        end

        it { expect(subject.to_schema["size"]["values"]).to eq expectation }
      end
    end

    context "booleans" do
      it { expect(subject.to_schema["active"]["name"]).to eq "active" }
      it { expect(subject.to_schema["active"]["type"]).to eq "boolean" }
      it { expect(subject.to_schema["active"]["source"]).to eq "Products::MensShoes::Fields::Active" }
    end
  end
end
