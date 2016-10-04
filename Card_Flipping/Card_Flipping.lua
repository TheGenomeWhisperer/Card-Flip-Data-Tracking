
-- Author: TheGenomeWhisperer


SLASH_FLIP1 = '/flip';

-- Saved Variables
cardFlipTableOmens_Save = {};
cardFlipTableMFC_Save = {};

-- MFC tracking
local cardsTenSilverCount = 0;
local cardsFiftySilverCount = 0;
local cardOneCount = 0;
local cardFiveCount = 0;
local cardTwentyCount = 0;
local cardFiftyCount = 0;
local cardTwoHundredCount = 0;
local cardOneThousandCount = 0;
local cardFiveThousandCount = 0;

-- OMENS tracking for current session - Historical is saved in array
local omensOneCopperCount = 0;
local omensTenSilverCount = 0;
local omensFiftySilverLuckCount = 0;
local omensFiftySilverArmorCount = 0;
local omensOneGoodCount = 0;
local omensOneEnemiesCount = 0;
local omensFiveChancesCount = 0;
local omensFiveDestinyCount = 0;
local omensTenCount = 0;
local omensTwentyCount = 0;
local omensFiftyCount = 0;
local omensOneHundredCount = 0;
local omensOneThousandCount = 0;
local omensThreeThousandCount = 0;
local omensSixThousandCount = 0;

--Mysterious Fortune Card to Fortune Card
local cardsTenSilver = {"62557","62561","62560","62554","62552","62553","62563","62555","62556","62567","62573","62572","62575","62576","62571","62570","62566","62565","62247","62568","62569","62559","62558","62564","62574","62562"};
local cardsFiftySilver = {"62586","62591","62584","62585","62577","62246","62582","62578","62590","62583","62579","62581","62580","62588","62589","62587"};
local cardOne = {"60839","62598","62600","62599","62601"};
local cardFive = {"62603","62604","60841","62602","62605"};
local cardTwenty = {"60842"};
local cardFifty = {"62606","60843"};
local cardTwoHundred = {"60845"};
local cardOneThousand = {"60840"};
local cardFiveThousand = {"60844"};
local allCards = {cardsTenSilver,cardsFiftySilver,cardOne,cardFive,cardTwenty,cardFifty,cardTwoHundred,cardOneThousand,cardFiveThousand};

--Omens Card to Blood Card
-- Multi-Array unnecessary due to only 1 card per values
-- Order = 1c,10s,50s(luck),50s(armor),1g(no good),1g(enemies),5g(chances),5g(destiny),10g,20g,50g,100g,1000g,3000g,5000g
local allOmensCards = {"113340","113341","113342","113343","113344","113345","113347","113346","113348","113349","113350","113351","113352","113353","113354"};

-- Addon event tracking "frame"
local flipEvent = CreateFrame("Frame");

-- Initializes the saved tables to default ZERO value.
function SetSavedCardFlipTable()
    -- Omens Table
    for i = 1,15 do
        cardFlipTableOmens_Save[i] = 0;
    end
    -- MFC Table
    for i = 1,9 do
        cardFlipTableMFC_Save[i] = 0;
    end 
end

-- Method on detection of a looting event.
function CardCounting(self,event,msg)
    -- Iterating through all of the arrays. Breaks function(return) on discovery.

    -- MFCs
    for i = 1,#allCards do
        for _,mfcCards in ipairs(allCards[i]) do
            if (string.match(msg,mfcCards)) then
                if cardFlipTableMFC_Save[1] == nil then
                    SetSavedCardFlipTable();
                end
                if i == 1 then
                    cardsTenSilverCount = cardsTenSilverCount + 1;
                    cardFlipTableMFC_Save[i] = cardFlipTableMFC_Save[i] + 1;
                    return;
                elseif i == 2 then
                    cardsFiftySilverCount = cardsFiftySilverCount + 1;
                    cardFlipTableMFC_Save[i] = cardFlipTableMFC_Save[i] + 1;
                    return;
                elseif i == 3 then
                    cardOneCount = cardOneCount + 1;
                    cardFlipTableMFC_Save[i] = cardFlipTableMFC_Save[i] + 1;
                    return;
                elseif i == 4 then
                    cardFiveCount = cardFiveCount + 1;
                    cardFlipTableMFC_Save[i] = cardFlipTableMFC_Save[i] + 1;
                    return;
                elseif i == 5 then
                    cardTwentyCount = cardTwentyCount + 1;
                    cardFlipTableMFC_Save[i] = cardFlipTableMFC_Save[i] + 1;
                    return;
                elseif i == 6 then
                    cardFiftyCount = cardFiftyCount + 1;
                    cardFlipTableMFC_Save[i] = cardFlipTableMFC_Save[i] + 1;
                    return;
                elseif i == 7 then
                    cardTwoHundredCount = cardTwoHundredCount + 1;
                    cardFlipTableMFC_Save[i] = cardFlipTableMFC_Save[i] + 1;
                    return;
                elseif i == 8 then
                    cardOneThousandCount = cardOneThousandCount + 1;
                    cardFlipTableMFC_Save[i] = cardFlipTableMFC_Save[i] + 1;
                    return;
                elseif i == 9 then
                    cardFiveThousandCount = cardFiveThousandCount + 1;
                    cardFlipTableMFC_Save[i] = cardFlipTableMFC_Save[i] + 1;
                    return;
                end
            end
        end
    end

    -- OMENS CARDS
    local i = 1;
    for _,omensCards in ipairs(allOmensCards) do
        if (string.match(msg,omensCards)) then
            if cardFlipTableOmens_Save[1] == nil then
                SetSavedCardFlipTable();
            end
            if i == 1 then
                omensOneCopperCount = omensOneCopperCount + 1;
                cardFlipTableOmens_Save[i] = cardFlipTableOmens_Save[i] + 1;
                return;
            elseif i == 2 then
                omensTenSilverCount = omensTenSilverCount + 1;
                cardFlipTableOmens_Save[i] = cardFlipTableOmens_Save[i] + 1;
                return;
            elseif i == 3 then
                omensFiftySilverLuckCount = omensFiftySilverLuckCount + 1;
                cardFlipTableOmens_Save[i] = cardFlipTableOmens_Save[i] + 1;
                return;
            elseif i == 4 then
                omensFiftySilverArmorCount = omensFiftySilverArmorCount + 1;
                cardFlipTableOmens_Save[i] = cardFlipTableOmens_Save[i] + 1;
                return;
            elseif i == 5 then
                omensOneGoodCount = omensOneGoodCount + 1;
                cardFlipTableOmens_Save[i] = cardFlipTableOmens_Save[i] + 1;
                return;
            elseif i == 6 then
                omensOneEnemiesCount = omensOneEnemiesCount + 1;
                cardFlipTableOmens_Save[i] = cardFlipTableOmens_Save[i] + 1;
                return;
            elseif i == 7 then
                omensFiveChancesCount = omensFiveChancesCount + 1;
                cardFlipTableOmens_Save[i] = cardFlipTableOmens_Save[i] + 1;
                return;
            elseif i == 8 then
                omensFiveDestinyCount = omensFiveDestinyCount + 1;
                cardFlipTableOmens_Save[i] = cardFlipTableOmens_Save[i] + 1;
                return;
            elseif i == 9 then
                omensTenCount = omensTenCount + 1;
                cardFlipTableOmens_Save[i] = cardFlipTableOmens_Save[i] + 1;
                return;
            elseif i == 10 then
                omensTwentyCount = omensTwentyCount + 1;
                cardFlipTableOmens_Save[i] = cardFlipTableOmens_Save[i] + 1;
                return;
            elseif i == 11 then
                omensFiftyCount = omensFiftyCount + 1;
                cardFlipTableOmens_Save[i] = cardFlipTableOmens_Save[i] + 1;
                return;
            elseif i == 12 then
                omensOneHundredCount = omensOneHundredCount + 1;
                cardFlipTableOmens_Save[i] = cardFlipTableOmens_Save[i] + 1;
                return;
            elseif i == 13 then
                omensOneThousandCount = omensOneThousandCount + 1;
                cardFlipTableOmens_Save[i] = cardFlipTableOmens_Save[i] + 1;
                return;
            elseif i == 14 then
                omensThreeThousandCount = omensThreeThousandCount + 1;
                cardFlipTableOmens_Save[i] = cardFlipTableOmens_Save[i] + 1;
                return;
            elseif i == 15 then
                omensSixThousandCount = omensSixThousandCount + 1;
                cardFlipTableOmens_Save[i] = cardFlipTableOmens_Save[i] + 1;
                return;
            end
        end
        i = i + 1;
    end
end

-- UNFORTUNATELY THIS METHOD DOES NOT WORK... "UseContainerItem()" appears to be protected in Lua.
-- This will sell all MFCs and Omens Cards if at a vendor.
-- Vendoring is a protected function it turns out...
-- function VendorCards()
--     local name = GetMerchantItemInfo(1); 
--     local canRepair = CanMerchantRepair();
--     -- Determining if player is at a vendor.
--     if name ~= nil or canRepair == true then
--         -- Sell macro for MFCs.
--         for b = 0,4 do
--             for s = 1,GetContainerNumSlots(b) do 
--                 local _,_,_,_,_,_,l,_,_,d=GetContainerItemInfo(b,s);
--                 if d ~= nil then 
--                     for i = 1,#allCards do
--                         for j = 1,#allCards[i] do
--                             if allCards[i][j] == d then
--                                 UseContainerItem(b,s);
--                                 print("Selling "..l);
--                             end
--                         end
--                     end
--                     -- Sell macro for Omens Cards
--                     -- To Be added.
--                 end
--             end
--         end
--     else
--         print("Unable to Sell Cards. Player is Not at a Vendor!");
--     end
-- end

-- Adds up all HISTORICAL MFC gold value.
function TotalMFCValueHistorical()
    local result = (cardFlipTableMFC_Save[1]*0.1)+(cardFlipTableMFC_Save[2]*0.5)+(cardFlipTableMFC_Save[3]*1)+(cardFlipTableMFC_Save[4]*5)+(cardFlipTableMFC_Save[5]*20)+(cardFlipTableMFC_Save[6]*50)+(cardFlipTableMFC_Save[7]*200)+(cardFlipTableMFC_Save[8]*1000)+(cardFlipTableMFC_Save[9]*5000);
    return result;
end

--Adds up gold value of this session
function TotalMFCValue()
    local result = (cardsTenSilverCount*0.1)+(cardsFiftySilverCount*0.5)+(cardOneCount*1)+(cardFiveCount*5)+(cardTwentyCount*20)+(cardFiftyCount*50)+(cardTwoHundredCount*200)+(cardOneThousandCount*1000)+(cardFiveThousandCount*5000);
    return result
end

-- Adds up gold value of all Blood Cards
function TotalOmensValue()
    local result = (omensOneCopperCount*0.001)+(omensTenSilverCount*0.1)+(omensFiftySilverArmorCount*0.5)+(omensFiftySilverLuckCount*0.5)+(omensOneEnemiesCount*1)+(omensOneGoodCount*1)+(omensFiveChancesCount*5);
    result = result + (omensFiveDestinyCount*5)+(omensTenCount*10)+(omensTwentyCount*20)+(omensFiftyCount*50)+(omensOneHundredCount*100)+(omensOneThousandCount*1000)+(omensThreeThousandCount*3000)+(omensSixThousandCount*6000);
    return result;
end

-- Adds up historal value of Blood Cards
function TotalOmensValueHistorical()
    local result = (cardFlipTableOmens_Save[1]*0.001)+(cardFlipTableOmens_Save[2]*0.1)+(cardFlipTableOmens_Save[3]*0.5)+(cardFlipTableOmens_Save[4]*0.5)+(cardFlipTableOmens_Save[5]*1)+(cardFlipTableOmens_Save[6]*1)+(cardFlipTableOmens_Save[7]*5);
    result = result + (cardFlipTableOmens_Save[8]*5)+(cardFlipTableOmens_Save[9]*10)+(cardFlipTableOmens_Save[10]*20)+(cardFlipTableOmens_Save[11]*50)+(cardFlipTableOmens_Save[12]*100)+(cardFlipTableOmens_Save[13]*1000)+(cardFlipTableOmens_Save[14]*3000)+(cardFlipTableOmens_Save[15]*6000);
    return result;
end

-- Resets Card values
function FlipReset()
    -- MFCs
    cardsTenSilverCount = 0;
    cardsFiftySilverCount = 0;
    cardOneCount = 0;
    cardFiveCount = 0;
    cardTwentyCount = 0;
    cardFiftyCount = 0;
    cardTwoHundredCount = 0;
    cardOneThousandCount = 0;
    cardFiveThousandCount = 0;
    -- Omens
    omensOneCopperCount = 0;
    omensTenSilverCount = 0;
    omensFiftySilverLuckCount = 0;
    omensFiftySilverArmorCount = 0;
    omensOneGoodCount = 0;
    omensOneEnemiesCount = 0;
    omensFiveChancesCount = 0;
    omensFiveDestinyCount = 0;
    omensTenCount = 0;
    omensTwentyCount = 0;
    omensFiftyCount = 0;
    omensOneHundredCount = 0;
    omensOneThousandCount = 0;
    omensThreeThousandCount = 0;
    omensSixThousandCount = 0;
end

-- resets historical data
function FlipResetHistorical()
    for i = 1,#cardFlipTableOmens_Save do
        cardFlipTableOmens_Save[i] = 0;
    end
    for i = 1,#cardFlipTableMFC_Save do
        cardFlipTableMFC_Save[i] = 0;
    end
end

-- Activating Tracking
flipEvent:RegisterEvent("CHAT_MSG_LOOT");
flipEvent:SetScript("OnEvent",CardCounting);

SlashCmdList["FLIP"] = function(input)
    if input == nil or input:trim() == "" then
        local MFCTotal = TotalMFCValue();
        local OmensTotal = TotalOmensValue();

        -- Reporting Fortune Card Totals
        if MFCTotal > 0 then
            print("MYSTERIOUS FORTUNE CARD RESULTS - CURRENT SESSION")
            print(".1g:         " .. cardsTenSilverCount);
            print(".5g:         " .. cardsFiftySilverCount);
            print("1g:          " .. cardOneCount);
            print("5g:          " .. cardFiveCount);
            print("20g:        " .. cardTwentyCount);
            print("50g:        " .. cardFiftyCount);
            print("200g:      " .. cardTwoHundredCount);
            print("1000g:    " .. cardOneThousandCount);
            print("5000g:    " .. cardFiveThousandCount .. "                         HISTORICAL COUNT");
            local TotalMFCFinalValue = TotalMFCValue();
            local TotalMFCFinalValueHistorical = TotalMFCValueHistorical();
            local totalCountMFC = cardsTenSilverCount+cardsFiftySilverCount+cardOneCount+cardFiveCount+cardTwentyCount+cardFiftyCount+cardTwoHundredCount+cardOneThousandCount+cardFiveThousandCount;
            local totalCountMFCHistorical = 0;
            for i = 1,#cardFlipTableMFC_Save do
                totalCountMFCHistorical = totalCountMFCHistorical + cardFlipTableMFC_Save[i];
            end
            -- For tab allignment
            if totalCountMFC < 10 then
                print("Total Cards: " .. totalCountMFC .. "                   (" .. totalCountMFCHistorical .. ")");
            elseif totalCountMFC < 100 then
                print("Total Cards: " .. totalCountMFC .. "                 (" .. totalCountMFCHistorical .. ")");
            elseif totalCountMFC < 1000 then
                print("Total Cards: " .. totalCountMFC .. "               (" .. totalCountMFCHistorical .. ")");
            elseif totalCountMFC < 10000 then
                print("Total Cards: " .. totalCountMFC .. "             (" .. totalCountMFCHistorical .. ")");
            else
                print("Total Cards: " .. totalCountMFC .. "           (" .. totalCountMFCHistorical .. ")");
            end
            if TotalMFCFinalValue < 10 then
                print("Total Value: " .. string.format("%.3f",TotalMFCFinalValue) .. "            (" .. string.format("%.3f",TotalMFCFinalValueHistorical) .. "g)");
            elseif TotalMFCFinalValue < 100 then
                print("Total Value: " .. string.format("%.3f",TotalMFCFinalValue) .. "          (" .. string.format("%.3f",TotalMFCFinalValueHistorical) .. "g)");
            elseif TotalMFCFinalValue < 1000 then
                print("Total Value: " .. string.format("%.3f",TotalMFCFinalValue) .. "        (" .. string.format("%.3f",TotalMFCFinalValueHistorical) .. "g)");
            elseif TotalMFCFinalValue < 10000 then
                print("Total Value: " .. string.format("%.3f",TotalMFCFinalValue) .. "      (" .. string.format("%.3f",TotalMFCFinalValueHistorical) .. "g)");
            else
                print("Total Value: " .. string.format("%.3f",TotalMFCFinalValue) .. "    (" .. string.format("%.3f",TotalMFCFinalValueHistorical) .. "g)");
            end
            if TotalMFCFinalValue/totalCountMFC < 10 then
                print("Avg. Per Card: " .. string.format("%.3f",TotalMFCFinalValue/totalCountMFC) .. "        (" .. string.format("%.3f",TotalMFCFinalValueHistorical/totalCountMFCHistorical) .. "g)");
            else
                print("Avg. Per Card: " .. string.format("%.3f",TotalMFCFinalValue/totalCountMFC) .. "      (" .. string.format("%.3f",TotalMFCFinalValueHistorical/totalCountMFCHistorical) .. "g)");
            end
        end
        -- Cleaner formatting if reporting both tables
        if MFCTotal > 0 and OmensTotal > 0 then
            print("\n");
        end
        -- Reporting Blood Card Totals
        if OmensTotal > 0 then
            print("CARD OF OMENS RESULTS - CURRENT SESSION");
            print(".001g            " .. omensOneCopperCount);
            print(".1g                " .. omensTenSilverCount);
            if (omensFiftySilverLuckCount+omensFiftySilverArmorCount > 0) then
                print(".5g:               " .. omensFiftySilverLuckCount+omensFiftySilverArmorCount .. " (" .. omensFiftySilverLuckCount .. " x 'luck' and " .. omensFiftySilverArmorCount .. " x 'armor')");
            else
                print(".5g:               " .. 0);
            end
            if (omensOneGoodCount+omensOneEnemiesCount > 0) then
                print("1g:                " .. omensOneGoodCount+omensOneEnemiesCount .. " (" .. omensOneGoodCount .. " x 'no good' and " .. omensOneEnemiesCount .. " x 'enemies')");
            else
                print("1g:                " .. 0);
            end
            if (omensFiveChancesCount+omensFiveDestinyCount > 0) then
                print("5g:                " .. omensFiveChancesCount+omensFiveDestinyCount .. " (" .. omensFiveChancesCount .. " x 'chances' and " .. omensFiveDestinyCount .. " x 'destiny')");
            else
                print("5g:                " .. 0);
            end
            print("10g:              " .. omensTenCount);
            print("20g:              " .. omensTwentyCount);
            print("50g:              " .. omensFiftyCount);
            print("100g:            " .. omensOneHundredCount);
            print("1000g:          " .. omensOneThousandCount);
            print("3000g:          " .. omensThreeThousandCount);
            print("6000g:          " .. omensSixThousandCount .. "                   HISTORICAL COUNT");
            local totalCount = omensOneCopperCount+omensTenSilverCount+omensFiftySilverArmorCount+omensFiftySilverLuckCount+omensOneEnemiesCount+omensOneGoodCount+omensFiveChancesCount+omensFiveDestinyCount;
            totalCount = totalCount + omensTenCount+omensTwentyCount+omensFiftyCount+omensOneHundredCount+omensOneThousandCount+omensThreeThousandCount+omensSixThousandCount;
            local totalFinalOmensValue = TotalOmensValue();
            local totalFinalOmensValueHistorical = TotalOmensValueHistorical();
            local totalHistoricalCount = 0;
            for i =1,#cardFlipTableOmens_Save do
                totalHistoricalCount = totalHistoricalCount + cardFlipTableOmens_Save[i];
            end
            -- For tab allignment
            if totalCount < 10 then
                print("Total Cards: " .. totalCount .. "                   (" .. totalHistoricalCount .. ")");
            elseif totalCount < 100 then
                print("Total Cards: " .. totalCount .. "                 (" .. totalHistoricalCount .. ")");
            elseif totalCount < 1000 then
                print("Total Cards: " .. totalCount .. "               (" .. totalHistoricalCount .. ")");
            elseif totalCount < 10000 then
                print("Total Cards: " .. totalCount .. "             (" .. totalHistoricalCount .. ")");
            else
                print("Total Cards: " .. totalCount .. "           (" .. totalHistoricalCount .. ")");
            end
            if totalFinalOmensValue < 10 then
                print("Total Value: " .. string.format("%.3f",totalFinalOmensValue) .. "            (" .. string.format("%.3f",totalFinalOmensValueHistorical) .. "g)");
            elseif totalFinalOmensValue < 100 then
                print("Total Value: " .. string.format("%.3f",totalFinalOmensValue) .. "          (" .. string.format("%.3f",totalFinalOmensValueHistorical) .. "g)");
            elseif totalFinalOmensValue < 1000 then
                print("Total Value: " .. string.format("%.3f",totalFinalOmensValue) .. "        (" .. string.format("%.3f",totalFinalOmensValueHistorical) .. "g)");
            elseif totalFinalOmensValue < 10000 then
                print("Total Value: " .. string.format("%.3f",totalFinalOmensValue) .. "      (" .. string.format("%.3f",totalFinalOmensValueHistorical) .. "g)");
            else
                print("Total Value: " .. string.format("%.3f",totalFinalOmensValue) .. "    (" .. string.format("%.3f",totalFinalOmensValueHistorical) .. "g)");
            end
            if totalFinalOmensValue/totalCount < 10 then
                print("Avg. Per Card: " .. string.format("%.3f",totalFinalOmensValue/totalCount) .. "        (" .. string.format("%.3f",totalFinalOmensValueHistorical/totalHistoricalCount) .. "g)");
            else
                print("Avg. Per Card: " .. string.format("%.3f",totalFinalOmensValue/totalCount) .. "      (" .. string.format("%.3f",totalFinalOmensValueHistorical/totalHistoricalCount) .. "g)");
            end
        end
        
        -- No Results
        if MFCTotal == 0 and OmensTotal == 0 then
            print("No Card Flip Data Has Been Collected this Session!");
            print("Type /flip history to see Total Historical Count");
        end

    -- Print Complete Historical data
    elseif input == "history" then
        local MFCHistoricalTotal = TotalMFCValueHistorical();
        local OmensHistoricalTotal = TotalOmensValueHistorical();

        if MFCHistoricalTotal == 0 and OmensHistoricalTotal == 0 then
            print("No Card Flip Data Has Been Collected Yet!");
        end

        if MFCHistoricalTotal > 0 then
            print("MYSTERIOUS FORTUNE CARD HISTORICAL RESULTS")
            print(".1g:         " .. cardFlipTableMFC_Save[1]);
            print(".5g:         " .. cardFlipTableMFC_Save[2]);
            print("1g:          " .. cardFlipTableMFC_Save[3]);
            print("5g:          " .. cardFlipTableMFC_Save[4]);
            print("20g:        " .. cardFlipTableMFC_Save[5]);
            print("50g:        " .. cardFlipTableMFC_Save[6]);
            print("200g:      " .. cardFlipTableMFC_Save[7]);
            print("1000g:    " .. cardFlipTableMFC_Save[8]);
            print("5000g:    " .. cardFlipTableMFC_Save[9]);
            local TotalMFCFinalValueHistorical = TotalMFCValueHistorical();
            local totalCountMFCHistorical = 0;
            for i = 1,#cardFlipTableMFC_Save do
                totalCountMFCHistorical = totalCountMFCHistorical + cardFlipTableMFC_Save[i];
            end
            print("Total Cards: " .. totalCountMFCHistorical);
            print("Total Value: " .. string.format("%.3f",TotalMFCFinalValueHistorical));
            print("Avg. Per Card: " .. string.format("%.3f",TotalMFCFinalValueHistorical/totalCountMFCHistorical));
        end
        -- Cleaner formatting if reporting both tables
        if MFCHistoricalTotal > 0 and OmensHistoricalTotal > 0 then
            print("\n");
        end
        -- Reporting Blood Card Totals
        if OmensHistoricalTotal > 0 then
            print("CARD OF OMENS HISTORICAL RESULTS");
            print(".001g            " .. cardFlipTableOmens_Save[1]);
            print(".1g                " .. cardFlipTableOmens_Save[2]);
            if (cardFlipTableOmens_Save[3]+cardFlipTableOmens_Save[4] > 0) then
                print(".5g:               " .. cardFlipTableOmens_Save[3]+cardFlipTableOmens_Save[4] .. " (" .. cardFlipTableOmens_Save[3] .. " x 'luck' and " .. cardFlipTableOmens_Save[4] .. " x 'armor')");
            else
                print(".5g:               " .. 0);
            end
            if (cardFlipTableOmens_Save[5]+cardFlipTableOmens_Save[6] > 0) then
                print("1g:                " .. cardFlipTableOmens_Save[5]+cardFlipTableOmens_Save[6] .. " (" .. cardFlipTableOmens_Save[5] .. " x 'no good' and " .. cardFlipTableOmens_Save[6] .. " x 'enemies')");
            else
                print("1g:                " .. 0);
            end
            if (cardFlipTableOmens_Save[7]+cardFlipTableOmens_Save[8] > 0) then
                print("5g:                " .. cardFlipTableOmens_Save[7]+cardFlipTableOmens_Save[8] .. " (" .. cardFlipTableOmens_Save[7] .. " x 'chances' and " .. cardFlipTableOmens_Save[8] .. " x 'destiny')");
            else
                print("5g:                " .. 0);
            end
            print("10g:              " .. cardFlipTableOmens_Save[9]);
            print("20g:              " .. cardFlipTableOmens_Save[10]);
            print("50g:              " .. cardFlipTableOmens_Save[11]);
            print("100g:            " .. cardFlipTableOmens_Save[12]);
            print("1000g:          " .. cardFlipTableOmens_Save[13]);
            print("3000g:          " .. cardFlipTableOmens_Save[14]);
            print("6000g:          " .. cardFlipTableOmens_Save[15]);
            local totalFinalOmensValueHistorical = 0;
            for i =1,#cardFlipTableOmens_Save do
                totalFinalOmensValueHistorical = totalFinalOmensValueHistorical + cardFlipTableOmens_Save[i];
            end
            print("Total Cards: " .. totalFinalOmensValueHistorical);
            print("Total Value: " .. string.format("%.3f",OmensHistoricalTotal));
            print("Avg. Per Card: " .. string.format("%.3f",OmensHistoricalTotal/totalFinalOmensValueHistorical));
        end
    --Reset
    elseif input == "reset" then
        print("Card Flip Data Has Been RESET for this session.");
        FlipReset();
    
    elseif input == "resetAll" then
        print("All Card Flip Data, including SAVED, has been RESET.");
        FlipReset();
        FlipResetHistorical();
          
    -- All commands!
    elseif input == "help" then
        local result = "\n------------------------------------------\n---          CARD FLIPPING          ---\n----          INFORMATION          ----\n------------------------------------------";
            result = result .. "\nTo Check Current Progress:         /flip";
            result = result .. "\nFor ALL saved counts:                  /flip history";
            result = result .. "\nReset Current Session to Zero:   /flip reset";
            result = result .. "\nReset Saved Data to Zero:          /flip resetAll";
            print(result);
    -- Input is bad
    else
        print("ERROR! Input not recognized.");
        print("Please type /flip help for info.");
    end
end
