describe OvenJob do
    let(:user) { FactoryGirl.create(:user) }
    let(:oven) { user.ovens.first }

    describe "OvenJob" do

      it "should put the job in the queue V2" do
        oven = FactoryGirl.build(:oven)
        cookie = FactoryGirl.create(:cookie, storage: oven)
        
        Resque.enqueue(OvenJob, oven.id)
        sleep(5.seconds)
        #puts "RESULT: #{Resque.info.to_json} #{Resque.info[:workers]} #{Resque.info[:working] == 0}"
        expect(Resque.info[:workers]).to_not be_zero
      end
    end
  end