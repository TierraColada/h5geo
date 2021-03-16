#include "../include/h5core/h5core_enum.h"

#include <H5File.hpp>
#include <H5Group.hpp>
#include <H5DataSet.hpp>
#include <H5DataSpace.hpp>
#include <H5Attribute.hpp>

using namespace h5geo;

char h5geo::getDelimiter(h5geo::Delimiter delimiter){
  if (delimiter == h5geo::Delimiter::DOT)
    return '.';
  else if (delimiter == h5geo::Delimiter::COMMA)
    return ',';
  else if (delimiter == h5geo::Delimiter::SPACE)
    return ' ';
  else if (delimiter == h5geo::Delimiter::SEMICOLON)
    return ';';
  else if (delimiter == h5geo::Delimiter::TABULATION)
    return '\n';

  return ' ';
}
