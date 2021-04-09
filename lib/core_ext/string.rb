module CoreExt::String
  refine ::String do
    def underscore
      Hanami::Utils::String.underscore(self)
    end
  end
end
