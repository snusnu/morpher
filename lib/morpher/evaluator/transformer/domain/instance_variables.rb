# encoding: UTF-8

module Morpher
  class Evaluator
    class Transformer
      class Domain < self
        # Abstract namespace class for domain objects via instance variables
        class InstanceVariables < self
          include AbstractType

          # Evaluator for dumping domain objects via instance variables
          class Dump < self

            register :dump_instance_variables

            # Call evaluator
            #
            # @param [Object] input
            #
            # @return [Hash<Symbol, Object>]
            #
            # @api private
            #
            def call(input)
              param.instance_variable_names.each_with_object({}) do |name, aggregate|
                value = input.instance_variable_get(name)
                aggregate[name.to_s[1..-1].to_sym] = value
              end
            end

            # Return inverse evaluator
            #
            # @return [Evaluator]
            #
            # @api private
            #
            def inverse
              Load.new(param)
            end

          end # Dump

          # Evaluator for loading domain objects via attributes hash
          class Load < self

            register :load_instance_variables

            # Call evaluator
            #
            # @param [Object] input
            #
            # @return [Object]
            #   an instance of an anima infected class
            #
            # @api private
            #
            def call(input)
              invoke(input)
            end

            # Return evaluation
            #
            # @param [Object] input
            #
            # @return [Evaluation]
            #
            # @api private
            #
            def evaluation(input)
              evaluation_success(input, invoke(input))
            end

            # Return inverse evaluator
            #
            # @return [Evaluator]
            #
            # @api private
            #
            def inverse
              Dump.new(param)
            end

          private

            # Invoke the transformation
            #
            # @return [Object]
            #
            # @api private
            #
            def invoke(input)
              object = param.model.allocate
              param.attribute_names.zip(param.instance_variable_names).each do |attribute_name, ivar_name|
                object.instance_variable_set(ivar_name, input.fetch(attribute_name))
              end
              object
            end

          end # Load
        end # Domain
      end # Anima
    end # Transformer
  end # Evaluator
end # Morpher
