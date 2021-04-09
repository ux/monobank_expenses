module CoreExt::Hash
  refine ::Hash do
    def deep_transform_keys(&block)
      each_with_object({}) do |(key, value), output|
        output[yield(key)] = case value
                             when ::Hash, ::Array then value.deep_transform_keys(&block)
                             else value
                             end
      end
    end
  end

  refine ::Array do
    def deep_transform_keys(&block)
      map do |value|
        case value
        when ::Hash, ::Array then value.deep_transform_keys(&block)
        else value
        end
      end
    end
  end
end
