; extends

(fenced_code_block
  (info_string (language) @lang)
  (#eq? @lang "dataviewjs")
  (code_fence_content) @injection.content
  (#set! injection.language "javascript")
)
