require 'spec_helper'

describe Morpher::Evaluator::Predicate::EQL do
  let(:object) { described_class.new(1.0) }

  let(:valid_input)   { 1.0 }
  let(:invalid_input) { 1   }

  it_should_behave_like 'a predicate evaluator'
end