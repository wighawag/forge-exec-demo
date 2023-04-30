// @ts-check
import { execute } from "forge-exec-ipc-server";
import { encodeDeployData, encodeFunctionData } from 'viem';

import fs from 'fs';
const Counter = JSON.parse(fs.readFileSync('out/Counter.sol/Counter.json', 'utf-8'));

execute(async (forge) => {
  const counter = await forge.create({
    data:encodeDeployData({abi: Counter.abi, args: [], bytecode: Counter.bytecode.object})
  });

  await forge.call({
    from: "0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266",
    to: counter,
    data: encodeFunctionData({...Counter, functionName: 'setNumber', args: [42n]})
  });

  return {
    types: [{
      type: "address",
    }],
    values: [counter],
  };
});
