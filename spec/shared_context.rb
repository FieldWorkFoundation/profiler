RSpec.shared_context 'shared context', shared_context: :metadata do
  let(:assessment) { SelfAssessment.new(name: 'Finance') }
  let(:profile)    { Profile.new(name: 'NGO', country: 'Kenya') }
  let(:question)   { Question.new(label: 'Have a budget?') }
  let(:option)     { Option.new(label: 'Yes') }
end

RSpec.configure do |rspec|
  rspec.include_context 'shared context', include_shared: true
end
