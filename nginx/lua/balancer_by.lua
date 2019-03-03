local balancer = require "ngx.balancer"
if not ngx.ctx.tries then
  ngx.ctx.tries = 0
else
  ngx.sleep(5)
end
if ngx.ctx.tries < 100 then
  balancer.set_more_tries(1)
end
ngx.ctx.tries = ngx.ctx.tries + 1
local consul_balancer = require "balancer"
local peer = consul_balancer.next(ngx.ctx.service)
if peer == nil then
  ngx.log(ngx.ERR, "no peer found for service: ", ngx.ctx.service)
  return ngx.exit(500)
end
local ok, err = balancer.set_current_peer(peer["address"], peer["port"])
if not ok then
  ngx.log(ngx.ERR, "failed to set the current peer: ", err)
  return ngx.exit(500)
end
