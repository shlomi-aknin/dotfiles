local prettier = {
  simple = {'prettier --single-quote --arrow-parents always -w'},
  javascript = {'prettier --single-quote --arrow-parents always -w'}
}

require('format').setup({
    javascript = {
        {cmd = prettier.javascript}
    },
    css = {
        {cmd = prettier.simple}
    },
    html = {
        {cmd = prettier.simple}
    },
})
