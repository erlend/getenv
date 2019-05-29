# frozen_string_literal: true

require './getenv'

RSpec.describe Getenv do
  let(:random_value) { rand(99).times.map { ('a'..'z').to_a.sample }.join }

  describe 'getter' do
    subject { Getenv.variable_name }

    context 'when variable exists' do
      before { ENV['variable_name'] = random_value }

      it { is_expected.to eq random_value }
    end

    context 'when variable is missing' do
      before { ENV.delete 'variable_name' }

      it { is_expected.to eq nil }
    end
  end

  describe 'question' do
    subject { Getenv.variable_name? }

    context 'when variable exists' do
      before { ENV['variable_name'] = random_value }

      it { is_expected.to be true }
    end

    context 'when variable is missing' do
      before { ENV.delete 'variable_name' }

      it { is_expected.to be false }
    end
  end

  describe 'setter' do
    subject { ENV['variable_name'] }
    before { Getenv.variable_name = random_value }

    it { is_expected.to eq random_value }
  end

  describe 'exclamation' do
    context 'when variable exists' do
      subject { Getenv.variable_name! }
      before { ENV['variable_name'] = random_value }

      it { is_expected.to eq random_value }
    end

    context 'when variable is missing' do
      subject { -> { Getenv.variable_name! } }
      before { ENV.delete 'variable_name' }

      it { is_expected.to raise_error Getenv::Error }
    end
  end

  describe '#respond_to_missing?' do
    subject { Getenv.respond_to? :variable_name }
    it { is_expected.to be true }
  end
end
