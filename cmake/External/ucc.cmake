if(NOT __UCC_INCLUDED)
  set(__UCC_INCLUDED TRUE)

  if(USE_SYSTEM_UCC)
    find_package(UCC REQUIRED)
    find_package(UCX REQUIRED)
    if(UCC_FOUND AND UCX_FOUND)
      add_library(__caffe2_ucc INTERFACE)
      target_link_libraries(__caffe2_ucc INTERFACE ucx::ucs ucx::ucp ucc::ucc)
      target_include_directories(__caffe2_ucc INTERFACE ${UCC_INCLUDE_DIRS})
    endif()
  else()
    message(FATAL_ERROR "USE_SYSTEM_UCC=OFF is not supported yet when using UCC")
  endif()
endif()