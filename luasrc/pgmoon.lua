local resources = ngx.var.resources
local json = require "cjson"
local pgmoon = require("pgmoon")

json.encode_empty_table_as_object("on")

local pg = pgmoon.new({
    host = "127.0.0.1",
    port = "5432",
    database = "openresty_org",
    user = "openresty",
    password="speedtheweb"
})

assert(pg:connect())

local res = assert(pg:query("select html_body from posts_cn where id = " ..
    pg:escape_literal("1")))

for i,v in ipairs(res) do
    -- ngx.say(string.format("%s\t%s",i,json.encode(v)))
    ngx.say(string.format("%s\t%s",i,v['html_body']))
end
