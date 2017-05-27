function type_instable_loop(n)
  for i = 1:n
    type_instable() * 2
  end
end

function type_stable_loop(n)
  for i = 1:n
    type_stable() * 2
  end
end

type_instable() = (rand(Bool) ? 1 : 2.0)

type_stable() = (rand(Bool) ? 1 : 2)

function test_type_stable(n, k)
  time = 0
  for i = 1:k
    tic()
    type_stable_loop(n)
    time = time + toq()
  end
  time / n
end

function test_type_instable(n, k)
  time = 0
  for i = 1:k
    tic()
    type_instable_loop(n)
    time = time + toq()
  end
  time / n
end
