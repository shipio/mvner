module Mvner
  module Attributes
    extend ActiveSupport::Concern

    included do
      def self.mvn_attributes(symbol_or_symbols, prefix_or_prefixes = '')
        symbols = symbol_or_symbols.is_a?(Array) ? symbol_or_symbols : [symbol_or_symbols]
        symbols.each do |symbol|
          key = symbol.to_s.camelize(:lower)
          attributes << key.underscore.to_sym
          define_method key.underscore.to_sym do
            items = self.first_set(prefix_or_prefixes, key)
            value = (items.nil? || items.empty?) ? nil : items.first.content
            instance_variable_set("@#{key.underscore}", value) if instance_variable_get("@#{key.underscore}").nil?
            instance_variable_get("@#{key.underscore}")
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

    module ClassMethods

      def attributes
        @attributes ||= []
      end
    end

    def initialize(*args)
      self.class.ancestors.map{|anc| anc.attributes if anc.respond_to? :attributes}.flatten.
          select{|attr| !attr.nil? }.each { |attr| self.send(attr) }
    end
  end
end