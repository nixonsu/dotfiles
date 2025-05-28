-- ~/.config/nvim/lua/custom/plugins/yaml_cfn_tags.lua
return {
  "neovim/nvim-lspconfig",
  dependencies = { "b0o/SchemaStore.nvim" },
  config = function()
    local lspconfig = require("lspconfig")
    local schemastore = require("schemastore")

    -- 1) grab all the default schemas
    local schemas = schemastore.yaml.schemas()
    -- 2) override the AWS CloudFormation schema URL
    schemas["AWS CloudFormation"] =
      "https://raw.githubusercontent.com/aws-cloudformation/cfn-lint-schema/master/schema/cfn-lint.json"

    -- 3) list out all the CFN intrinsic tags (scalar + sequence forms)
    local cfn_tags = {
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
    }

    lspconfig.yamlls.setup({
      settings = {
        yaml = {
          schemaStore = { enable = false }, -- disable built-in store
          schemas = schemas, -- our merged list, including CFN
          customTags = cfn_tags, -- register all the CFN tags
        },
      },
    })
  end,
}
