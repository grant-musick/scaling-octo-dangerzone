require './app/testme.rb'

describe TestMe, "method1"  do

  it "returns hello when invoked" do
    testme = TestMe.new
    testme.method1.should eq("hello")
  end
end

describe TestMe, "method2" do

  it "returns world when invoked" do
    testme = TestMe.new
    testme.method2.should eq("world")
  end

end
