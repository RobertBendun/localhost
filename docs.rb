$docs = [
  { prefix: "arch",   root: "/usr/share/doc/arch-wiki/html/", autoindex: true },
  { prefix: "clang",  root: "/usr/share/doc/clang/html" },
  { prefix: "cmake",  root: "/usr/share/doc/cmake/html/" },
  { prefix: "erlang", root: "/usr/share/doc/erlang/doc/" },
  { prefix: "ffmpeg", root: "/usr/share/doc/ffmpeg/", index: "ffmpeg.html" },
  { prefix: "fmt",    root: "/usr/share/doc/fmt/" },
  { prefix: "python", root: "/usr/share/doc/python/html" },
]

begin
  $docs <<= { prefix: "rust",   root: File.dirname(`rustup doc --path`) }
rescue
  puts "failed to run rustup doc --path"
  exit 1
end

$docs = $docs.filter do |doc|
  next true if File.exists? doc[:root]
  STDERR.puts "skipping #{doc[:prefix]}, root #{doc[:root]} not found"
  next false
end.sort_by do |d| d[:prefix] end
