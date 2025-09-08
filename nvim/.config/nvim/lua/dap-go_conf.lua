require("dap-go").setup({
  dap_configurations = {
    {
      type = "go",
      name = "Attach remote",
      mode = "remote",
      request = "attach",
      hostName = os.getenv("DLV_HOSTNAME"),
      port = os.getenv("DLV_PORT"),
    },
  },
})
