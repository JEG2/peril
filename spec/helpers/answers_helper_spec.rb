require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the AnswersHelper. For example:
#
# describe AnswersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe AnswersHelper do
  it "can process Markdown" do
    processed = helper.render_with_code("code: `40 + 2`")
    expect(processed).to match(/<code>40 \+ 2<\/code>/)
  end
end
