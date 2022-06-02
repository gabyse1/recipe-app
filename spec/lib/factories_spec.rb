require 'rails_helper'

FACTORIES_TO_IGNORE = %i[invalid_author invalid_post].freeze

RSpec.describe 'Factories collection', order: :defined do
  let(:factories) do
    factories = FactoryBot.factories
    if FACTORIES_TO_IGNORE.any?
      factories = factories.reject do |factory|
        factory.name =~ /#{FACTORIES_TO_IGNORE.join('|')}/
      end
    end
    factories
  end

  it 'builds valid entities' do
    linting = FactoryBot.lint(factories, traits: false, strategy: :build)

    expect(linting).to be_nil
  end

  it 'creates valid entities' do
    linting = FactoryBot.lint(factories, traits: false, strategy: :create)

    expect(linting).to be_nil
  end
end
