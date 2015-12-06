# Generates beautiful HTML pages for the dot files
require "redcarpet"
require "rugged"

class DotFileConvert
  def self.generate_html!
    filename = "index.html"
    data = new.generate_html

    puts "Overwrite exiting #{filename}? (y)"
    if gets.chomp == "y"
      File.open(filename, "w") do |file|
        file.write(data)
      end
      puts "#{filename} overwritten"
    end
  end
  
  def generate_html
    '<!doctype html>' +
    '<html>' +
    head +
    body +
    '</html>'
  end

  # Converts the vimrc file to markdown so it can be easily converted to HTML
  def vimrc_to_mkd
    repo = Rugged::Repository.new(".")

    vim_oid = repo.references["refs/heads/master"].target.tree.
      find{|r| r[:name] == ".vim"}[:oid]
    vimrc_oid = repo.lookup(vim_oid).find{|r| r[:name] == ".vimrc"}[:oid]
    text = repo.lookup(vimrc_oid).content

    text.
      gsub(/^([^\"])/, '    \0').       # Indent the code
      gsub(/\"\"\"*[ }]*/, "").         # Remove ending folds
      gsub(/^\" => (.*) {{{/, '## \0'). # Convert fold starts into heading
      gsub(/([\w ]*\n)\"==*/m, "### \\0"). # 3rd heading before === lines
      gsub(/\"==*/, "").                # Remove === lines
      gsub(/^\" (.*)/, "\n\\0\n").      # Empty lines bef/aft normal text
      gsub(/^\"\s*/, "").               # Now remove the '" ' prefixes
      gsub(/\" => /, "").               # Now remove the " => prefixes
      gsub(/ {{{/, "")                  # Now remove the {{{  prefixes
  end

  def section
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {})

    '<section>' +
    markdown.render(vimrc_to_mkd) +
    '</section>'
  end

  def body
    '<body>'\
    '  <div class="wrapper">' +
    header +
    section +
    footer +
    '  </div>'\
    '  <script src="javascripts/scale.fix.js"></script>'\
    '</body>'\
  end

  def head
    '<head>'\
    '  <meta charset="utf-8">'\
    '  <meta http-equiv="X-UA-Compatible" content="chrome=1">'\
    '  <title>Dot files by sagarjauhari</title>'\
    '  <link rel="stylesheet" href="stylesheets/styles.css">'\
    '  <link rel="stylesheet" href="stylesheets/github-light.css">'\
    '  <meta name="viewport" content="width=device-width">'\
    '  <!--[if lt IE 9]>'\
    '  <script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>'\
    '  <![endif]-->'\
    '</head>'\
  end

  def header
    '<header>'\
    '  <h1>Dot files</h1>'\
    '  <p>The name says it all</p>'\
    '  <p class="view"><a href="https://github.com/sagarjauhari/dot_files">View the Project on GitHub <small>sagarjauhari/dot_files</small></a></p>'\
    '  <ul>'\
    '    <li><a href="https://github.com/sagarjauhari/dot_files/zipball/master">Download <strong>ZIP File</strong></a></li>'\
    '    <li><a href="https://github.com/sagarjauhari/dot_files/tarball/master">Download <strong>TAR Ball</strong></a></li>'\
    '    <li><a href="https://github.com/sagarjauhari/dot_files">View On <strong>GitHub</strong></a></li>'\
    '  </ul>'\
    '</header>'\
  end

  def footer
    '<footer>'\
    '  <p>This project is maintained by <a href="https://github.com/sagarjauhari">sagarjauhari</a></p>'\
    '  <p><small>Hosted on GitHub Pages &mdash; Theme by <a href="https://github.com/orderedlist">orderedlist</a></small></p>'\
    '</footer>'\
  end
end

DotFileConvert.generate_html!
