_:
{
  vim = {
    lineNumberMode = "relative";
    
    options = {
      number = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      wrap = false;
    };
    
    diagnostics = {
      enable = true;
      config = {
        virtual_text = true;
        # virtual_lines = true;
        update_in_insert = true;
      };
    };
  };
}
