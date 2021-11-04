local prettier = {
  simple = {'prettier -w'},
  javascript = {'prettier --single-quote --arrow-parents always -w'},
  svelte = {'prettier --single-quote --arrow-parents --parser svelte always -w'}
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
    svelte = {
        {cmd = prettier.svelte}
    },
})
