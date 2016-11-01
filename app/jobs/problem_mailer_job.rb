class ProblemMailerJob < ApplicationJob
  queue_as :urgent

  def perform problem_id, options={}
    problem = Problem.find(problem_id)
    
    host = (Rails.env == "production") ? "www.snmmaurya.com" : "locahost:7000"
    if options[:admin] == true
      InformationsMailer.problem_information_mailer_to_the_admin({
        subject: "Notify: Problem Created",
        problem: problem,
        topic: problem.topic,
        user: problem.user,
        host: host
      }).deliver_now
    else
      InformationsMailer.problem_information_mailer_to_user({
        subject: "problem created by you!",
        problem: problem,
        topic: problem.topic,
        user: problem.user,
        host: host
      }).deliver_now
    end
  end
end
