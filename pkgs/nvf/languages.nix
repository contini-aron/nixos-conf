_:
let
  full = {
    enable = true;
    format.enable = true;
    extraDiagnostics.enable = true;
  };
  
  basic = {
    enable = true;
  };
in
{
  vim = {
    lsp.enable = true;
    treesitter.enable = true;
    
    languages = {
      # Infrastructure as Code
      nix.enable = true;
      terraform.enable = true;
      helm.enable = true;  # Kubernetes Helm charts
      
      # Scripting & Automation
      python.enable = true;
      bash.enable = true;
      go.enable = true;
      
      # Container & Orchestration
      yaml.enable = true;  # Kubernetes, Ansible, CI/CD
      
      # Documentation
      markdown.enable = true;
      
      # Other useful languages
      lua.enable = true;
      rust.enable = true;
      sql.enable = true;  # Database work
      
      # Optional.enable: Web/Frontend (if you work with dashboards/UI)
      # ts = basic;  # TypeScript/JavaScript
      # html = basic;
      # css = basic;
      
      # enables treesitter by default for enabled languages
      enableTreesitter = true;
      # enables format by default for enabled languages
      enableFormat = true;
      # enables LSP by default for enabled languages
      # enableLSP = true;
    };
  };
}
