namespace :elasticsearch do
  desc "Reindex Blog"
  task reindex_blog: :environment do
    STDOUT.puts "Reindexing Blog........!"
    Blog.reindex
  end

  desc "Reindex Problem"
  task reindex_problem: :environment do
    STDOUT.puts "Reindexing Problem........!"
    Problem.reindex
  end
end