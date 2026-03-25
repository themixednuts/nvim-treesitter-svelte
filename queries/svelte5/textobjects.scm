(element) @function.outer

(element
  (start_tag)
  .
  (_) @function.inner
  .
  (end_tag))

(element
  (start_tag)
  _+ @function.inner
  (end_tag))

(self_closing_tag) @function.outer

(attribute_value) @attribute.inner

(attribute) @attribute.outer

((element
  (start_tag
    (tag_name) @_tag)) @class.outer
  (#match? @_tag "^(html|section|h[0-9]|header|title|head|body)$"))

((element
  (start_tag
    (tag_name) @_tag)
  .
  (_) @class.inner
  .
  (end_tag))
  (#match? @_tag "^(html|section|h[0-9]|header|title|head|body)$"))

((element
  (start_tag
    (tag_name) @_tag)
  _+ @class.inner
  (end_tag))
  (#match? @_tag "^(html|section|h[0-9]|header|title|head|body)$"))

(comment) @comment.outer

(if_block) @block.outer @conditional.outer

(if_block
  (block_open)
  .
  _+ @block.inner @conditional.inner
  .
  [
    (else_if_clause)
    (else_clause)
    (block_end)
  ])

(else_if_clause) @conditional.outer

(else_if_clause
  (block_open)
  .
  _+ @conditional.inner
  .
  (block_close))

(else_clause) @conditional.outer

(else_clause
  (block_open)
  .
  _+ @conditional.inner
  .
  (block_close))

(each_block) @block.outer @loop.outer

(each_block
  (block_open)
  .
  _+ @block.inner @loop.inner
  .
  (block_end))

(await_block) @block.outer

(await_block
  (block_open)
  .
  _+ @block.inner
  .
  [
    (await_branch)
    (block_end)
  ])

(await_branch) @block.outer

(await_branch
  (block_open)
  .
  _+ @block.inner
  .
  (block_close))

(key_block) @block.outer

(key_block
  (block_open)
  .
  _+ @block.inner
  .
  (block_end))

(snippet_block) @block.outer

(snippet_block
  (block_open)
  .
  _+ @block.inner
  .
  (block_end))

(snippet_parameters
  parameter: (pattern) @parameter.inner)
