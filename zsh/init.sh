BASE_PATH="$(dirname $0)"

source "${BASE_PATH}/common.sh"

for FILE in "${BASE_PATH}/init.d/*.sh"; do
	source $FILE
done

if [ -n "${SYSTAG}" ]; then
	SYSTAG_INIT_PATH="${BASE_PATH}/init.d/${SYSTAG}"
	if [ -d "${SYSTAG_INIT_PATH}" ]; then
		for FILE in "${SYSTAG_INIT_PATH}/*.sh"; do
			source $FILE
		done
	fi
fi
