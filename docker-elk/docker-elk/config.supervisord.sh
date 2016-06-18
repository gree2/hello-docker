# config.supervisord.sh program_name program_bin program_home run_as
echo [program:$1]     | tee -a "/etc/supervisor/conf.d/$1.conf"
echo command=$2       | tee -a "/etc/supervisor/conf.d/$1.conf"
echo directory=$3     | tee -a "/etc/supervisor/conf.d/$1.conf"
echo autorestart=true | tee -a "/etc/supervisor/conf.d/$1.conf"
echo user=$4          | tee -a "/etc/supervisor/conf.d/$1.conf"
