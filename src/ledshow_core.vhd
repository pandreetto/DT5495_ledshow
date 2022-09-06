library ieee;
use IEEE.Std_Logic_1164.all;

entity ledshow_core is
port(
    clock : in  std_logic;
    led_reg : out std_logic_vector(7 downto 0)
);
end ledshow_core;

architecture rtl of ledshow_core is
    subtype ldirection is integer range -1 to 1;
    signal main_reg : std_logic_vector(7 downto 0) := "00000001";
begin
    led_reg <= main_reg;

    ctrl_proc : process(clock)
        variable led_dir : ldirection := 1;
    begin
        if rising_edge(clock) then

            if main_reg(0) = '1' then
                led_dir := 1;
                main_reg(0) <= '0';
                main_reg(1) <= '1';
            end if;

            for idx in 1 to 6 loop
                if main_reg(idx) = '1' then
                    main_reg(idx) <= '0';
                    main_reg(idx + led_dir) <= '1';
                end if;
            end loop;

            if main_reg(7) = '1' then
                led_dir := -1;
                main_reg(6) <= '1';
                main_reg(7) <= '0';
            end if;

        end if;
    end process ctrl_proc;
end rtl;
