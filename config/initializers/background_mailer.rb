Thread.new do
  loop do
    sleep 60
    BGMAIL.actor.poll
  end
end
