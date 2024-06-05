set -euo pipefail



export TS_NODE_FILES=true
if [ "${1}" == "checkout" ]; then
    BRANCH_TO_TEST=${2:-"master"}
    echo "Checking out geth at branch ${BRANCH_TO_TEST}..."
    ./node_modules/.bin/mocha --node-option loader=ts-node/esm src/e2e-tests/blockchain_parameters_tests.ts --branch ${BRANCH_TO_TEST}
elif [ "${1}" == "local" ]; then
    export GETH_DIR="${2}"
    echo "Testing using local geth dir ${GETH_DIR}..."
    ./node_modules/.bin/mocha --node-option loader=ts-node/esm src/e2e-tests/blockchain_parameters_tests.ts --localgeth ${GETH_DIR}
fi
