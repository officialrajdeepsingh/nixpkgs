{ lib
, buildPythonPackage
, fetchFromGitHub
, flit-core
, opentelemetry-api
, opentelemetry-sdk
, pytest-asyncio
, pytest-mock
, pytestCheckHook
, pythonOlder
, std-uritemplate
}:

buildPythonPackage rec {
  pname = "microsoft-kiota-abstractions";
  version = "1.3.0";
  pyproject = true;

  disabled = pythonOlder "3.8";

  src = fetchFromGitHub {
    owner = "microsoft";
    repo = "kiota-abstractions-python";
    rev = "refs/tags/v${version}";
    hash = "sha256-PAomuAOwpX5/ijVOi0hjTlUnSWgF+qsb3kpuydIV6nc=";
  };

  nativeBuildInputs = [
    flit-core
  ];

  propagatedBuildInputs = [
    opentelemetry-api
    opentelemetry-sdk
    std-uritemplate
  ];

  nativeCheckInputs = [
    pytest-asyncio
    pytest-mock
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "kiota_abstractions"
  ];

  meta = with lib; {
    description = "Abstractions library for Kiota generated Python clients";
    homepage = "https://github.com/microsoft/kiota-abstractions-python";
    changelog = "https://github.com/microsoft/kiota-abstractions-python/blob/${version}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ fab ];
  };
}
