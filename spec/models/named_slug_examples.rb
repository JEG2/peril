shared_examples "named slug" do
  it "requires a name" do
    named = described_class.new
    expect(named).to have_an_invalid_field(:name)

    named.name = "Test"
    expect(named).to have_a_valid_field(:name)
  end

  it "requires the name to be unique" do
    # allowed the first time
    named = FactoryGirl.create(described_class.name.underscore)

    dup = described_class.new(name: named.name)
    expect(dup).to have_an_invalid_field(:name)
  end

  it "generates a slug from the name" do
    named = described_class.new(name: "test")
    expect(named.slug).to eq("test")
  end

  it "downcases generated slugs" do
    named = described_class.new(name: "Test")
    expect(named.slug).to eq("test")
  end

  it "replaces all non-alphanumerics with dashes in generated slugs" do
    named = described_class.new(name: "key => value")
    expect(named.slug).to eq("key-value")
  end

  it "removes leading and trailing non-alphanumerics in generated slugs" do
    named = described_class.new(name: "  test!")
    expect(named.slug).to eq("test")
  end
end
