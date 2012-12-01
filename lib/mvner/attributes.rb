require 'active_support/concern'
require 'active_support/inflector'

module Mvner
  module Attributes
    extend ActiveSupport::Concern

    included do
      class_eval do
        def self.mvn_attributes(symbol_or_symbols, prefix_or_prefixes = '')
          symbols = symbol_or_symbols.is_a?(Array) ? symbol_or_symbols : [symbol_or_symbols]
          symbols.each do |symbol|
            key = symbol.to_s.camelize(:lower)
            define_method key.underscore.to_sym do
              items = self.first_set(prefix_or_prefixes, key)
              (items.nil? || items.empty?) ? nil : items.first.content
            end
          end
        end

        def first_set(prefix_or_prefixes, key)
          if prefix_or_prefixes.is_a?(Array)
            prefix_or_prefixes.map { |prefix| @doc.xpath(prefix + key) }.select { |node| !node.empty? }.first
          else
            @doc.xpath(prefix_or_prefixes + key)
          end
        end

      end
    end

  end
end