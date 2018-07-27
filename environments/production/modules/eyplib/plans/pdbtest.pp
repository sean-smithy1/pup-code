plan eyplib::pdbtest {
  return(puppetdb_query("nodes[certname] {}"))
}
