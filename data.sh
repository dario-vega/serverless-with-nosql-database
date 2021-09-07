mkdir ~/BaggageData
cd ~/BaggageData
curl https://raw.githubusercontent.com/dario-vega/ndcs_baggage_tracking_demo/main/data/generated_data/BaggageData.tar.gz -o BaggageData.tar.gz
tar xvzf BaggageData.tar.gz
rm  BaggageData.tar.gz

# Create a file to do a multi line load
rm -f load_multi_line.json
for file in `ls -1 ~/BaggageData/baggage_data* | tail -20`; do
  echo $file
  cat $file | tr '\n' ' ' >> load_multi_line.json
  echo >> load_multi_line.json
done

