json.pagination do
  json.current_page page.current_page
  json.total_pages  page.total_pages
  json.page_entries page.size
end
