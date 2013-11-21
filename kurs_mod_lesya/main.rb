require_relative "classes/queue"
require_relative "classes/timer"
require_relative "classes/chanel"

qa = Queue.new
qb = Queue.new
ca = Chanel.new
cb = Chanel.new
cs = Chanel.new
t = Timer.new
droped = 0
tickets_a = 0
tickets_b = 0
chan_a = 0
chan_b = 0
chan_sp = 0

while t.now? < t.end?
  if t.now?.to_f > t.time_ticket_a?
    tickets_a += 1
    if qa.length < 2
      qa.enq(1)
      random = '%.2f' % rand
      t.time_ticket_a(t.now?.to_f + 0.007 + 0.006 * random.to_f)
      puts ca.start_transact
      if ca.start_transact
        t.time_trans_a_to_b(t.now?.to_f + 0.01)
      end
    else
      if cs.start_transact
        random = '%.2f' % rand
        t.time_trans_sputnik(t.now?.to_f + 0.005 + 0.01 * random.to_f) 
      else
        droped +=1
      end
    end
  end

  if t.now?.to_f > t.time_ticket_b?
    tickets_b += 1
    if qb.length < 2
      qb.enq(1)
      random = '%.2f' % rand
      t.time_ticket_b(t.now?.to_f + 0.007 + 0.006 * random.to_f)
      if cb.start_transact
        t.time_trans_b_to_a(t.now?.to_f + 0.01)
      end
    else
      if cs.start_transact
        random = '%.2f' % rand
        t.time_trans_sputnik(t.now?.to_f + 0.005 + 0.01 * random.to_f) 
      else
        droped +=1
      end
    end
  end

  if not qa.empty?
    if t.now?.to_f > t.time_trans_a_to_b?
      qa.deq
      chan_a+= 1
      if not qa.empty?
        t.time_trans_a_to_b(t.now?.to_f + 0.01)
      else
        t.time_trans_a_to_b(0)
      end
    end
  end

  if not qb.empty?
    if t.now?.to_f > t.time_trans_b_to_a?
      qb.deq
      chan_b+=1
      if not qa.empty?
        t.time_trans_b_to_a(t.now?.to_f + 0.01)
      else
        t.time_trans_b_to_a(0)
      end
    end
  end

  if t.time_trans_sputnik? != 0
    if t.now?.to_f > t.time_trans_sputnik?
      chan_sp+=1
      t.time_trans_sputnik(0)
    end
  end
  puts "time #{t.now?.to_f} length A #{qa.length} length B #{qb.length} drop #{droped} tic_a #{tickets_a} tic_b #{tickets_b} chan_a #{chan_a} chan_b #{chan_b} chan_sp #{chan_sp}"
  puts " "
end
