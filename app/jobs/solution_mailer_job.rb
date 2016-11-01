class SolutionMailerJob < ApplicationJob
  queue_as :urgent

  def perform solution_id, options={}
    solution = Solution.find(solution_id)
    host = (Rails.env == "production") ? "www.snmmaurya.com" : "locahost:7000"

    if options[:admin] == true
      InformationsMailer.solution_information_mailer_to_the_admin({
        subject: "Notify: There is a solution for a problem",
        solution: solution,
        problem: solution.problem,
        topic: solution.problem.topic,
        user: solution.user,
        host: host
      }).deliver_now
    else
      InformationsMailer.solution_information_mailer_to_user({
        subject: "Solution for you problem",
        solution: solution,
        problem: solution.problem,
        topic: solution.problem.topic,
        user: solution.problem.user,
        host: host
      }).deliver_now
    end
  end
end