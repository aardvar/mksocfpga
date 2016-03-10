library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Created from serhm2.bin
-- On 2/21/2014

entity serhm2 is
	port (
	addr: in std_logic_vector(10 downto 0);
	clk: in std_logic;
	din: in std_logic_vector(23 downto 0);
	dout: out std_logic_vector(23 downto 0);
	we: in std_logic);
end serhm2;

architecture syn of serhm2 is
   type ram_type is array (0 to 2047) of std_logic_vector(23 downto 0);
   signal RAM : ram_type := 
   (
   x"000000", x"000000", x"000000", x"010000", x"8F0000",
   x"01FFFF", x"B0007B", x"B0007A", x"0100FA", x"100089",
   x"010000", x"B0007A", x"100099", x"100151", x"10014A",
   x"400140", x"330000", x"400132", x"330016", x"010000",
   x"B00079", x"200018", x"010001", x"B00079", x"4B0000",
   x"B0007A", x"01001F", x"700035", x"330020", x"000000",
   x"000000", x"200011", x"40007C", x"B0014F", x"010180",
   x"850000", x"100037", x"320011", x"000000", x"000000",
   x"0104B6", x"840000", x"20018B", x"B000B4", x"32000F",
   x"0104B6", x"840000", x"010180", x"850000", x"40007C",
   x"B00151", x"100067", x"40007C", x"B00152", x"20000F",
   x"B0003C", x"400031", x"B000AA", x"050000", x"38005E",
   x"013FFF", x"7000AA", x"B000AC", x"050000", x"B000DC",
   x"32005E", x"4000AC", x"E000B9", x"3C005E", x"B00021",
   x"000000", x"400030", x"B90000", x"B00020", x"01FFFE",
   x"C080AC", x"890001", x"330047", x"010020", x"700034",
   x"32005E", x"40014E", x"320057", x"400020", x"33005E",
   x"01FFFF", x"C080DC", x"010180", x"850000", x"010001",
   x"C08136", x"010001", x"B0003D", x"280000", x"010001",
   x"B00035", x"010008", x"508132", x"010001", x"C08138",
   x"010000", x"B0003D", x"280000", x"B0003E", x"010001",
   x"C08139", x"4000B4", x"B000B5", x"B00021", x"E000B8",
   x"3C0083", x"480000", x"B00036", x"B00020", x"880001",
   x"01FFFE", x"C080B5", x"33006F", x"40014E", x"32007C",
   x"400020", x"B00036", x"010002", x"C080B4", x"010001",
   x"C0813A", x"010001", x"B0003F", x"4000B4", x"B00037",
   x"280000", x"010001", x"C0813B", x"010010", x"508132",
   x"B0003F", x"280000", x"B000BE", x"0137CE", x"B000BF",
   x"000000", x"000000", x"01FFFF", x"C080BF", x"000000",
   x"000000", x"33008E", x"01FFFF", x"C080BE", x"33008A",
   x"000000", x"000000", x"280000", x"100179", x"015A00",
   x"B000EA", x"015A01", x"B000F2", x"015A02", x"B000FA",
   x"015A03", x"B00102", x"015A04", x"B0010A", x"015A05",
   x"B00112", x"015A06", x"B0011A", x"015A07", x"B00122",
   x"016F48", x"B000EE", x"017473", x"B000EF", x"016F4D",
   x"B000F0", x"013274", x"B000F1", x"016E55", x"B000F6",
   x"017375", x"B000F7", x"016465", x"B000F8", x"010000",
   x"B000F9", x"016E55", x"B000FE", x"017375", x"B000FF",
   x"016465", x"B00100", x"010000", x"B00101", x"015046",
   x"B00106", x"014147", x"B00107", x"016C46", x"B00108",
   x"016873", x"B00109", x"016954", x"B0010E", x"01656D",
   x"B0010F", x"017372", x"B00110", x"010000", x"B00111",
   x"016E55", x"B00116", x"017375", x"B00117", x"016465",
   x"B00118", x"010000", x"B00119", x"01424C", x"B0011E",
   x"013150", x"B0011F", x"015236", x"B00120", x"010057",
   x"B00121", x"01424C", x"B00126", x"013150", x"B00127",
   x"015236", x"B00128", x"01004F", x"B00129", x"010136",
   x"870000", x"010008", x"B0013D", x"010001", x"B0013C",
   x"B0007B", x"010003", x"B0014B", x"010001", x"B0014C",
   x"010001", x"B00081", x"010002", x"B00082", x"010003",
   x"B00083", x"010004", x"B00084", x"010005", x"B00085",
   x"010006", x"B00086", x"010007", x"B00087", x"010008",
   x"B00088", x"010010", x"B00089", x"018104", x"B000EB",
   x"010010", x"B000EC", x"010000", x"B000F3", x"010000",
   x"B000F4", x"010000", x"B000FB", x"010000", x"B000FC",
   x"018F04", x"B00103", x"018200", x"B00104", x"018202",
   x"B0010B", x"010003", x"B0010C", x"010000", x"B00113",
   x"010000", x"B00114", x"018202", x"B0011B", x"010004",
   x"B0011C", x"010202", x"B00123", x"010004", x"B00124",
   x"010400", x"B00090", x"010800", x"B00091", x"010C00",
   x"B00092", x"011000", x"B00093", x"011400", x"B00094",
   x"011800", x"B00095", x"011C00", x"B00096", x"010100",
   x"B00097", x"010200", x"B00098", x"010400", x"B000B9",
   x"010400", x"B000B8", x"0104B1", x"B000BB", x"0107FB",
   x"B000BA", x"01FFFF", x"B0007D", x"10046E", x"010004",
   x"C000E6", x"508104", x"01FFFF", x"B0007D", x"280000",
   x"014937", x"B00143", x"013039", x"B00144", x"014448",
   x"B00145", x"280000", x"000000", x"010003", x"70003F",
   x"B0014D", x"010001", x"B00035", x"B0003B", x"40014D",
   x"700082", x"33015E", x"010000", x"B0014E", x"200160",
   x"01FFFF", x"B0014E", x"40014D", x"700081", x"32016E",
   x"016666", x"B00032", x"B00038", x"010000", x"B00033",
   x"B00039", x"012840", x"B0003A", x"011408", x"B00034",
   x"280000", x"0104B7", x"B00032", x"B00038", x"010000",
   x"B00033", x"B00039", x"012840", x"B0003A", x"01FA08",
   x"B00034", x"280000", x"010080", x"860000", x"010000",
   x"BA0000", x"000000", x"000000", x"000000", x"8A0001",
   x"820000", x"040000", x"040000", x"040000", x"040000",
   x"040000", x"3C017B", x"000000", x"000000", x"280000",
   x"810000", x"C000DC", x"B000DD", x"800000", x"B000DE",
   x"490000", x"B000DF", x"000000", x"890001", x"01007F",
   x"7000DF", x"3201D8", x"B00099", x"013C00", x"7000DF",
   x"3301F2", x"010300", x"7000DF", x"E00098", x"3301D8",
   x"014000", x"7000DF", x"3201A6", x"490000", x"B000ED",
   x"890001", x"2001A7", x"4000ED", x"B00068", x"018000",
   x"7000DF", x"3301BC", x"B0006C", x"800000", x"E000BA",
   x"3C01E0", x"4000DF", x"B0006E", x"400060", x"B80000",
   x"400061", x"B80001", x"01FFFF", x"C08099", x"880002",
   x"3301AB", x"400068", x"B000ED", x"2001CD", x"490000",
   x"B00060", x"490001", x"B00061", x"810000", x"E000BB",
   x"3C01E0", x"B0006D", x"890002", x"4000DF", x"B0006E",
   x"01FFFF", x"C08099", x"3301BC", x"000000", x"400068",
   x"B000ED", x"810000", x"E000DD", x"380190", x"010001",
   x"C08137", x"010000", x"B0013F", x"800000", x"E000DE",
   x"040000", x"20002B", x"010001", x"508132", x"01FFFF",
   x"E00133", x"3201EF", x"010001", x"C08133", x"2001EF",
   x"010002", x"508132", x"01FFFF", x"E00134", x"3201EF",
   x"010001", x"C08134", x"2001EF", x"010004", x"508132",
   x"01FFFF", x"E00135", x"3201EF", x"010001", x"C08135",
   x"010000", x"8F0000", x"20002B", x"011C00", x"7000DF",
   x"E00093", x"3202A0", x"011C00", x"7000DF", x"E00090",
   x"320360", x"011C00", x"7000DF", x"E00091", x"320379",
   x"011C00", x"7000DF", x"E00092", x"3203AB", x"011C00",
   x"7000DF", x"E00094", x"320392", x"011C00", x"7000DF",
   x"E00096", x"320214", x"011C00", x"7000DF", x"E00095",
   x"32024E", x"011C00", x"7000DF", x"32034D", x"000000",
   x"000000", x"2001D8", x"012000", x"7000DF", x"33023B",
   x"010300", x"7000DF", x"E00097", x"3301D8", x"014000",
   x"7000DF", x"320222", x"490000", x"B00125", x"890001",
   x"200224", x"000000", x"400125", x"0B0000", x"860000",
   x"018000", x"7000DF", x"3301E8", x"820000", x"E00089",
   x"3C01E0", x"4A0142", x"B80000", x"010080", x"7000DF",
   x"320234", x"010002", x"C08125", x"8A0001", x"01FFFF",
   x"C08099", x"880001", x"330229", x"000000", x"000000",
   x"2001CD", x"100424", x"820000", x"E00088", x"3C01E0",
   x"4A0122", x"B80000", x"010080", x"7000DF", x"320247",
   x"010002", x"C080E2", x"8A0001", x"01FFFF", x"C08099",
   x"880001", x"33023C", x"000000", x"000000", x"2001CD",
   x"012000", x"7000DF", x"33028D", x"010300", x"7000DF",
   x"E00097", x"3301D8", x"014000", x"7000DF", x"32025C",
   x"490000", x"B0011D", x"890001", x"20025D", x"40011D",
   x"0B0000", x"860000", x"018000", x"7000DF", x"330274",
   x"820000", x"E00089", x"3C01E0", x"4A0132", x"B80000",
   x"010080", x"7000DF", x"32026D", x"010002", x"C0811D",
   x"8A0001", x"01FFFF", x"C08099", x"880001", x"330262",
   x"000000", x"000000", x"2001CD", x"820000", x"E00089",
   x"3C01E0", x"490000", x"BA0132", x"010080", x"7000DF",
   x"32027F", x"010002", x"C0811D", x"8A0001", x"01FFFF",
   x"C08099", x"890001", x"330274", x"40013C", x"B0007B",
   x"010132", x"B0009E", x"01001F", x"70013D", x"0B0000",
   x"C0009E", x"870000", x"2001CD", x"100424", x"820000",
   x"E00088", x"3C01E0", x"4A011A", x"B80000", x"010080",
   x"7000DF", x"320299", x"010002", x"C080E2", x"8A0001",
   x"01FFFF", x"C08099", x"880001", x"33028E", x"000000",
   x"000000", x"2001CD", x"012000", x"7000DF", x"33033A",
   x"010300", x"7000DF", x"E00097", x"3301D8", x"014000",
   x"7000DF", x"3202AE", x"490000", x"B0010D", x"890001",
   x"2002AF", x"40010D", x"0B0000", x"860000", x"018000",
   x"7000DF", x"3302F6", x"820000", x"E00088", x"3C01E0",
   x"820000", x"000000", x"3302BD", x"40007C", x"000000",
   x"2002E8", x"820000", x"E00081", x"3302C3", x"40012B",
   x"000000", x"2002E8", x"820000", x"E00082", x"3302C9",
   x"4A012A", x"000000", x"2002E8", x"820000", x"E00083",
   x"3302D0", x"010001", x"B000C1", x"100436", x"2002E8",
   x"820000", x"E00084", x"3302D7", x"010002", x"B000C1",
   x"100436", x"2002E8", x"820000", x"E00085", x"3302DE",
   x"010004", x"B000C1", x"100436", x"2002E8", x"820000",
   x"E00086", x"3302E5", x"010008", x"B000C1", x"100436",
   x"2002E8", x"010010", x"B000C1", x"100436", x"B80000",
   x"010080", x"7000DF", x"3202EF", x"010002", x"C0810D",
   x"8A0001", x"01FFFF", x"C08099", x"880001", x"3302B4",
   x"000000", x"000000", x"2001CD", x"820000", x"E00088",
   x"3C01E0", x"490000", x"BA012A", x"820000", x"330300",
   x"000000", x"000000", x"20032D", x"820000", x"E00081",
   x"330308", x"40007C", x"B000C6", x"000000", x"10044E",
   x"20032D", x"820000", x"E00082", x"33030E", x"000000",
   x"000000", x"20032D", x"820000", x"E00083", x"330315",
   x"010001", x"B000C1", x"100436", x"20032D", x"820000",
   x"E00084", x"33031C", x"010002", x"B000C1", x"100436",
   x"20032D", x"820000", x"E00085", x"330323", x"010004",
   x"B000C1", x"100436", x"20032D", x"820000", x"E00086",
   x"33032A", x"010008", x"B000C1", x"100436", x"20032D",
   x"010010", x"B000C1", x"100436", x"8A0001", x"010080",
   x"7000DF", x"320333", x"010002", x"C0810D", x"01FFFF",
   x"C08099", x"890001", x"3302F6", x"000000", x"000000",
   x"2001CD", x"100424", x"820000", x"E00088", x"3C01E0",
   x"4A010A", x"B80000", x"010080", x"7000DF", x"320346",
   x"010002", x"C080E2", x"8A0001", x"01FFFF", x"C08099",
   x"880001", x"33033B", x"000000", x"000000", x"2001CD",
   x"100424", x"820000", x"E00088", x"3C01E0", x"4A00EA",
   x"B80000", x"010080", x"7000DF", x"320359", x"010002",
   x"C080E2", x"8A0001", x"01FFFF", x"C08099", x"880001",
   x"33034E", x"000000", x"000000", x"2001CD", x"012000",
   x"7000DF", x"330366", x"000000", x"000000", x"2001E0",
   x"100424", x"820000", x"E00088", x"3C01E0", x"4A00F2",
   x"B80000", x"010080", x"7000DF", x"320372", x"010002",
   x"C080E2", x"8A0001", x"01FFFF", x"C08099", x"880001",
   x"330367", x"000000", x"000000", x"2001CD", x"012000",
   x"7000DF", x"33037F", x"000000", x"000000", x"2001E0",
   x"100424", x"820000", x"E00088", x"3C01E0", x"4A00FA",
   x"B80000", x"010080", x"7000DF", x"32038B", x"010002",
   x"C080E2", x"8A0001", x"01FFFF", x"C08099", x"880001",
   x"330380", x"000000", x"000000", x"2001CD", x"012000",
   x"7000DF", x"330398", x"000000", x"000000", x"2001E0",
   x"100424", x"820000", x"E00088", x"3C01E0", x"4A0112",
   x"B80000", x"010080", x"7000DF", x"3203A4", x"010002",
   x"C080E2", x"8A0001", x"01FFFF", x"C08099", x"880001",
   x"330399", x"000000", x"000000", x"2001CD", x"012000",
   x"7000DF", x"330411", x"014000", x"7000DF", x"3203B5",
   x"490000", x"B00105", x"890001", x"2003B6", x"400105",
   x"860000", x"012000", x"7000DF", x"330411", x"010300",
   x"7000DF", x"E00098", x"3301D8", x"018000", x"7000DF",
   x"3303E7", x"800000", x"E000BA", x"3C01E0", x"400105",
   x"3203CD", x"E00084", x"3203D3", x"E00084", x"3203D9",
   x"000000", x"000000", x"2001E0", x"10049C", x"4000E4",
   x"B80000", x"4000E5", x"B80001", x"2003DF", x"100455",
   x"010004", x"C080E4", x"010000", x"D080E5", x"2003DB",
   x"10049C", x"10046E", x"4000E6", x"B80000", x"4000E7",
   x"B80001", x"01FFFF", x"C08099", x"000000", x"880002",
   x"3303C1", x"000000", x"000000", x"2001CD", x"400105",
   x"3203F0", x"E00084", x"3203FE", x"E00088", x"3203F6",
   x"000000", x"000000", x"2001E0", x"10049C", x"490000",
   x"B000E4", x"490001", x"B000E5", x"20040A", x"10049C",
   x"015A03", x"E0013F", x"3301E8", x"000000", x"000000",
   x"100491", x"20040A", x"015A03", x"E0013F", x"3301E8",
   x"490000", x"B000E6", x"490001", x"B000E7", x"10047B",
   x"010004", x"C080E4", x"010000", x"D080E5", x"01FFFF",
   x"C08099", x"890002", x"3303E7", x"000000", x"000000",
   x"2001CD", x"100424", x"820000", x"E00088", x"3C01E0",
   x"4A0102", x"B80000", x"010080", x"7000DF", x"32041D",
   x"010003", x"C080E2", x"8A0001", x"01FFFF", x"C08099",
   x"880001", x"330412", x"000000", x"000000", x"2001CD",
   x"010300", x"7000DF", x"E00097", x"3301D8", x"018000",
   x"7000DF", x"3301E8", x"014000", x"7000DF", x"320432",
   x"490000", x"B000E2", x"890001", x"200433", x"4000E2",
   x"0B0000", x"860000", x"280000", x"010000", x"B000C5",
   x"40007C", x"B000C4", x"400070", x"7000C1", x"B000C3",
   x"400070", x"7000C1", x"B000C2", x"320443", x"4000C3",
   x"32044C", x"4000C2", x"B000C3", x"40007C", x"E000C4",
   x"B000C5", x"E0012C", x"38043D", x"010020", x"508132",
   x"4000C5", x"280000", x"40007C", x"E000C6", x"E0012B",
   x"38044E", x"000000", x"000000", x"280000", x"01AA02",
   x"E000E8", x"32045F", x"01AA02", x"B000E8", x"010000",
   x"B0007D", x"010003", x"1004BA", x"1004C3", x"010000",
   x"1004BA", x"B000E6", x"010000", x"1004BA", x"060000",
   x"5080E6", x"010000", x"1004BA", x"B000E7", x"010000",
   x"1004BA", x"060000", x"5080E7", x"280000", x"010000",
   x"B0007D", x"0100AB", x"1004BA", x"1004C3", x"010000",
   x"1004BA", x"B000E6", x"010000", x"B000E7", x"01FFFF",
   x"B0007D", x"280000", x"01AA03", x"E000E8", x"320486",
   x"01AA03", x"B000E8", x"1004D5", x"010000", x"B0007D",
   x"010002", x"1004BA", x"1004C3", x"4000E6", x"1004BA",
   x"4000E6", x"060000", x"1004BA", x"4000E7", x"1004BA",
   x"4000E7", x"060000", x"1004BA", x"280000", x"1004D5",
   x"010000", x"B0007D", x"0100D8", x"1004BA", x"1004C3",
   x"010BB8", x"1004A9", x"01AA01", x"B000E8", x"280000",
   x"01AA03", x"E000E8", x"3204A4", x"01FFFF", x"B0007D",
   x"01AA01", x"B000E8", x"280000", x"010005", x"1004A9",
   x"01AA01", x"B000E8", x"280000", x"B0009A", x"01FFFF",
   x"B0007D", x"1004CB", x"700081", x"3204B8", x"000000",
   x"010001", x"100089", x"01FFFF", x"C0809A", x"3304AC",
   x"000000", x"000000", x"2001E8", x"1004DC", x"280000",
   x"B0007E", x"000000", x"010002", x"70007D", x"3304BB",
   x"0100FF", x"70007E", x"B000E9", x"280000", x"4000E5",
   x"1004BA", x"4000E4", x"060000", x"1004BA", x"4000E4",
   x"1004BA", x"280000", x"010000", x"B0007D", x"010005",
   x"1004BA", x"010000", x"1004BA", x"01FFFF", x"B0007D",
   x"4000E9", x"280000", x"010000", x"B0007D", x"010006",
   x"1004BA", x"010001", x"B0007D", x"280000", x"010000",
   x"B0007D", x"010004", x"1004BA", x"010001", x"B0007D",
   x"280000", x"011100", x"B00068", x"01FFFF", x"B00060",
   x"B00061", x"B0006D", x"000000", x"000000", x"000000",
   x"011104", x"B00068", x"01FFFF", x"B00060", x"B00061",
   x"B0006D", x"000000", x"000000", x"000000", x"011108",
   x"B00068", x"01FFFF", x"B00060", x"B00061", x"B0006D",
   x"000000", x"000000", x"000000", x"01110C", x"B00068",
   x"01FFFF", x"B00060", x"B00061", x"B0006D", x"000000",
   x"000000", x"000000", x"011000", x"B00068", x"010000",
   x"B00060", x"B00061", x"B0006D", x"000000", x"000000",
   x"000000", x"011004", x"B00068", x"010000", x"B00060",
   x"B00061", x"B0006D", x"000000", x"000000", x"000000",
   x"011008", x"B00068", x"010000", x"B00060", x"B00061",
   x"B0006D", x"000000", x"000000", x"000000", x"01100C",
   x"B00068", x"010000", x"B00060", x"B00061", x"B0006D",
   x"000000", x"000000", x"000000", x"280000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"000000", x"000000", x"000000",
   x"000000", x"000000", x"00ABCD");

signal daddr: std_logic_vector(10 downto 0);

begin
   aserhm2: process (clk)
   begin
      if (clk'event and clk = '1') then
         if (we = '1') then
            RAM(conv_integer(addr)) <= din;
         end if;
         daddr <= addr;
      end if; -- clk 
   end process;

   dout <= RAM(conv_integer(daddr));
end;
