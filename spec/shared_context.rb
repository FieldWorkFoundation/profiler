RSpec.shared_context 'shared context', shared_context: :metadata do
  let(:assessment) { SelfAssessment.new(name: 'Finance') }
  let(:profile)    { Profile.new(name: 'NGO', country: 'Kenya') }
  let(:question)   { Question.new(label: 'Have a budget?') }
  let(:option)     { Option.new(label: 'Yes') }
  let(:rating)     { Rating.new(assessment: assessment, profile: profile) }
  let(:answer)     { Answer.new }
end

RSpec.configure do |rspec|
  rspec.include_context 'shared context', include_shared: true
end
