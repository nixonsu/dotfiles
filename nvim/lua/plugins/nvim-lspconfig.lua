-- ~/.config/nvim/lua/custom/plugins/yaml_cfn_tags.lua
return {
  "neovim/nvim-lspconfig",
  dependencies = { "b0o/SchemaStore.nvim" },
  opts = {
    servers = {
      yamlls = {
        settings = {
          yaml = {
            schemaStore = { enable = false },
            schemas = (function()
              local schemas = require("schemastore").yaml.schemas()
              schemas["AWS CloudFormation"] =
                "https://raw.githubusercontent.com/aws-cloudformation/cfn-lint-schema/master/schema/cfn-lint.json"
              return schemas
            end)(),
            customTags = {
              "!Ref",
              "!Ref sequence",
              "!GetAtt",
              "!GetAtt sequence",
              "!Sub",
              "!Sub sequence",
              "!FindInMap",
              "!FindInMap sequence",
              "!ImportValue",
              "!ImportValue sequence",
              "!Select",
              "!Select sequence",
              "!Split",
              "!Split sequence",
              "!Join",
              "!Join sequence",
              "!Base64",
              "!Base64 sequence",
              "!Cidr",
              "!Cidr sequence",
              "!And",
              "!And sequence",
              "!Equals",
              "!Equals sequence",
              "!If",
              "!If sequence",
              "!Not",
              "!Not sequence",
              "!Or",
              "!Or sequence",
              "!Transform",
              "!Transform sequence",
            },
          },
        },
      },
    },
  },
}
