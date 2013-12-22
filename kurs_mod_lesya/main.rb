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
chan_sp_time = 0

while t.now? < t.end?
  if t.now?.to_f > t.time_ticket_a?
    tickets_a += 1
    random = '%.2f' % rand
    t.time_ticket_a(t.now?.to_f + 0.006 + 0.006 * random.to_f)
    if qa.length < 3
      qa.enq(1)
      #puts ca.start_transact
      t.time_trans_a_to_b(t.now?.to_f + 0.01) if ca.start_transact        
    else
      if cs.start_transact
        random = '%.2f' % rand
        t.time_trans_sputnik(t.now?.to_f + 0.005 + 0.01 * random.to_f)
	chan_sp_time += 0.005 + 0.01 * random.to_f
      else
        droped +=1
      end
    end
  end

  if t.now?.to_f > t.time_ticket_b?
    tickets_b += 1
    random = '%.2f' % rand
    t.time_ticket_b(t.now?.to_f + 0.006 + 0.006 * random.to_f)
    if qb.length < 3
      qb.enq(1)
      t.time_trans_b_to_a(t.now?.to_f + 0.01) if cb.start_transact
    else
      if cs.start_transact
        random = '%.2f' % rand
        t.time_trans_sputnik(t.now?.to_f + 0.005 + 0.01 * random.to_f) 
        chan_sp_time += 0.005 + 0.01 * random.to_f
      else
        droped +=1
      end
    end
  end

  if not qa.empty?
    if t.now?.to_f > t.time_trans_a_to_b?
      qa.deq
      ca.end_transact
      chan_a+= 1
      if not qa.empty?
        t.time_trans_a_to_b(t.now?.to_f + 0.01) if ca.start_transact
      else
        t.time_trans_a_to_b(0)
      end
    end
  end

  if not qb.empty?
    if t.now?.to_f > t.time_trans_b_to_a?
      qb.deq
      cb.end_transact
      chan_b+=1
      if not qa.empty?
        t.time_trans_b_to_a(t.now?.to_f + 0.01) if cb.start_transact
      else
        t.time_trans_b_to_a(0)
      end
    end
  end

  if t.time_trans_sputnik? != 0
    if t.now?.to_f > t.time_trans_sputnik?
      cs.end_transact
      chan_sp+=1
      t.time_trans_sputnik(0)
    end
  end
  
end
chan_sp_f = chan_sp_time/0.6
puts "time #{t.now?.to_f} drop #{droped} tic_a #{tickets_a} tic_b #{tickets_b} chan_a #{chan_a} chan_b #{chan_b} chan_sp #{chan_sp} chan_sp_time #{'%.4f' % chan_sp_time} chan_sp_f #{'%.4f' % chan_sp_f}"
