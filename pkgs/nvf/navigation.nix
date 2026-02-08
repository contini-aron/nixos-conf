_:
{
  vim = {
    navigation.harpoon = {
      mappings = {
        markFile = "<leader>ha";
        listMarks = "<leader>hh";
      };
      enable = true;
    };
    
    mini = {
      # statusline.enable = true;
      # file navigation
      files.enable = true;
      # start screen
      starter.enable = true;
      # show indentation lines
      indentscope.enable = true;
    };
    
    # utility = {
    #   motion.flash-nvim = {
    #     enable = true;
    #     mappings.jump = "f";
    #   };
    # };
  };
}
